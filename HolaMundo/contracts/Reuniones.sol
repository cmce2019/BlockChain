pragma solidity ^0.5.0;
contract Reuniones{
    
          struct Foto{
        string hash;
        string url;
          }
    
      struct Reunion{
        uint id;
        string tema;
        string fecha;
        Foto[] foto;
    }
 
    
       mapping (uint=>Reunion) reuniones;

        
        
        function registrarReunion (uint id,string memory tema, string memory fecha) public{
       reuniones[id].id=id;
       reuniones[id].tema=tema;
       reuniones[id].fecha=fecha;
}

        function registrarFoto(uint idReunion, string memory hash, string memory url) public{
            Foto memory foto= Foto(hash,url);
            reuniones[idReunion].foto.push(foto);
    
        }

  function consultarNumeroDeFotos(uint id) public view returns(uint){
            return(reuniones[id].foto.length);
        }
        
        
 function consultarFoto(uint idReunion, uint idFoto) public view returns(string memory, string memory){
            return(reuniones[idReunion].foto[idFoto].url, reuniones[idReunion].foto[idFoto].hash);
        }
        
function consultarReunion(uint idReunion) public view returns(string memory, string memory){
            return(reuniones[idReunion].tema, reuniones[idReunion].fecha);
        }
        
        
        function consultarAutenticidadSegun(uint idReunion, string memory hash, uint idFoto) public view returns(bool){
            return(keccak256(abi.encodePacked(reuniones[idReunion].foto[idFoto].hash))==keccak256(abi.encodePacked(hash)));
        }
        
        
        
        
        
      
}